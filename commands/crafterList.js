const mysql = require("mysql2");
const { EmbedBuilder } = require("discord.js");
require("dotenv").config();

// Connection configuration
const dbConfig = {
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
};

module.exports = {
  async getCrafters(sRecipe, interaction) {
    const connection = mysql.createConnection(dbConfig);

    return new Promise((resolve, reject) => {
      // Connect to the database
      connection.connect((error) => {
        if (error) {
          console.error("Failed to connect to the database:", error);
          reject(error);
          return;
        }

        console.log("Connected to the database");

        // Update the query_count table
        const updateQuery = `
          UPDATE query_count
          SET query_counter = query_counter + 1
          WHERE query_command = 'command_who'
        `;
        connection.query(updateQuery, (error, updateResult) => {
          if (error) {
            console.error("Failed to update the query_count table:", error);
            reject(error);
            return;
          }

          // Query the crafting_characters table
          const query = `
            SELECT c.crafting_character, r.recipe_name
            FROM crafting_characters c
            INNER JOIN crafting_recipes r ON c.crafting_recipe_ID = r.recipe_ID
            WHERE c.crafting_recipe_ID = ?
          `;
          connection.query(query, [sRecipe], (error, results) => {
            if (error) {
              console.error("Failed to query the crafting_characters table:", error);
              reject(error);
              return;
            }

            connection.end((error) => {
              if (error) {
                console.error("Failed to close the database connection:", error);
              } else {
                console.log("Database connection closed");
              }
            });

            const crafters = results.map((crafter) => crafter.crafting_character).join(", ");
            const recipeName = results.length > 0 ? results[0].recipe_name : "Unknown Recipe";

            if (results.length == 0) {
              var embed = new EmbedBuilder().setTitle("Crafters").setDescription(`No crafters found.`);
            } else {
              var embed = new EmbedBuilder().setTitle("Crafters").setDescription(`Crafters for recipe "${recipeName}": ${crafters}`);
            }

            // Send the message to the user
            interaction.reply({ embeds: [embed], ephemeral: true });
            resolve(results);
          });
        });
      });
    });
  },

  async addCrafter(craftingRecipeID, craftingCharacter, interaction) {
    const connection = mysql.createConnection(dbConfig);

    return new Promise((resolve, reject) => {
      // Connect to the database
      connection.connect((error) => {
        if (error) {
          console.error("Failed to connect to the database:", error);
          reject(error);
          return;
        }

        console.log("Connected to the database");

        // Retrieve the item name from crafting_recipes table
        const getItemQuery = "SELECT recipe_name FROM crafting_recipes WHERE recipe_ID = ?";
        connection.query(getItemQuery, [craftingRecipeID], (error, itemResult) => {
          if (error) {
            console.error("Failed to retrieve item name from crafting_recipes table:", error);
            reject(error);
            return;
          }

          const itemName = itemResult[0].recipe_name;

          // Check for duplicate entry
          const duplicateQuery = "SELECT * FROM crafting_characters WHERE crafting_recipe_ID = ? AND crafting_character = ?";
          connection.query(duplicateQuery, [craftingRecipeID, craftingCharacter], (error, duplicateResult) => {
            if (error) {
              console.error("Failed to check for duplicate entry:", error);
              reject(error);
              return;
            }

            if (duplicateResult.length > 0) {
              // Duplicate entry found
              const errorMessage = `Crafter "${craftingCharacter}" for item "${itemName}" is already registered.`;
              interaction.reply({ content: errorMessage, ephemeral: true });
              resolve();
              return;
            }

            // Insert into the crafting_characters table
            const insertQuery = "INSERT INTO crafting_characters (crafting_recipe_ID, crafting_character) VALUES (?, ?)";
            connection.query(insertQuery, [craftingRecipeID, craftingCharacter], (error, results) => {
              if (error) {
                console.error("Failed to insert into the crafting_characters table:", error);
                reject(error);
                return;
              }

              connection.end((error) => {
                if (error) {
                  console.error("Failed to close the database connection:", error);
                } else {
                  console.log("Database connection closed");
                }
              });

              // Send success message to the interaction
              const successMessage = `Crafter "${craftingCharacter}" has been successfully added for item "${itemName}".`;
              interaction.reply({ content: successMessage, ephemeral: true });

              resolve(results);
            });
          });
        });
      });
    });
  },
};
