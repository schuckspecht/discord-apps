const mysql = require("mysql");
const { ActionRowBuilder, StringSelectMenuBuilder } = require("discord.js");
// Connection configuration
const dbConfig = {
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
};

module.exports = {
  async getProfessionRecipes(sProfession, interaction) {
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

        // Query the crafting_recipes table
        const query = `SELECT * FROM crafting_recipes WHERE recipe_profession = ?`;
        connection.query(query, [sProfession], (error, results) => {
          if (error) {
            console.error("Failed to query the crafting_recipes table:", error);
            reject(error);
            return;
          }

          var aData = [];
          results.forEach((oRecipe) => {
            var oObj = {
              value: oRecipe.recipe_ID,
              label: oRecipe.recipe_name,
            };
            aData.push(oObj);
          });

          connection.end((error) => {
            if (error) {
              console.error("Failed to close the database connection:", error);
            } else {
              console.log("Database connection closed");
            }
          });
          console.log(aData);
          resolve(aData);
        });
      });
    });
  },

  async getJcRecipesByColor(sColor, interaction) {
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

        // Query the crafting_recipes table
        const query = `SELECT * FROM crafting_recipes WHERE jc_color = ?`;
        connection.query(query, [sColor], (error, results) => {
          if (error) {
            console.error("Failed to query the crafting_recipes table:", error);
            reject(error);
            return;
          }

          var aData = [];
          results.forEach((oRecipe) => {
            var oObj = {
              value: oRecipe.recipe_ID,
              label: oRecipe.recipe_name,
            };
            aData.push(oObj);
          });

          connection.end((error) => {
            if (error) {
              console.error("Failed to close the database connection:", error);
            } else {
              console.log("Database connection closed");
            }
          });
          console.log(aData);
          resolve(aData);
        });
      });
    });
  },
};
