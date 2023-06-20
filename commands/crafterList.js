const mysql = require("mysql");
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

        // Insert into the crafting_characters table
        const query = "INSERT INTO crafting_characters (crafting_recipe_ID, crafting_character) VALUES (?, ?)";
        connection.query(query, [craftingRecipeID, craftingCharacter], (error, results) => {
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
          const successMessage = `Crafter "${craftingCharacter}" has been successfully added for recipe ID ${craftingRecipeID}.`;
          interaction.reply({ embeds: [successMessage], ephemeral: true });

          resolve(results);
        });
      });
    });
  },
};
