require("dotenv").config();
const { Client, IntentsBitField, REST, Routes, ActionRowBuilder, StringSelectMenuBuilder } = require("discord.js");
const recipeList = require("./commands/recipeList");
const crafterList = require("./commands/crafterList");

const client = new Client({
  intents: [IntentsBitField.Flags.Guilds, IntentsBitField.Flags.GuildMembers, IntentsBitField.Flags.GuildMessages, IntentsBitField.Flags.MessageContent],
});

client.on("ready", (x) => {
  console.log(`${x.user.tag} is online`);
});

client.on("unhandledRejection", (error) => {
  console.error("Unhandled promise rejection:", error);
});

client.on("interactionCreate", async (interaction) => {
  console.log(interaction.member.user.username);
  if (interaction.isChatInputCommand()) {
    if (interaction.commandName === "craftersearch") {
      const recipeProfessionOption = interaction.options.getString("recipe_profession");

      if (recipeProfessionOption.includes("jc")) {
        const aData = await recipeList.getJcRecipesByColor(recipeProfessionOption.split("-")[1], interaction);
        const response = {
          content: "Please select a recipe:",
          ephemeral: true,
          components: [new ActionRowBuilder().addComponents(new StringSelectMenuBuilder().setCustomId("recipeSelect").setPlaceholder("Select a crafting recipe").addOptions(aData))],
        };

        await interaction.reply(response);
      } else {
        const aData = await recipeList.getProfessionRecipes(recipeProfessionOption, interaction);

        const response = {
          content: "Please select a recipe:",
          ephemeral: true,
          components: [new ActionRowBuilder().addComponents(new StringSelectMenuBuilder().setCustomId("recipeSelect").setPlaceholder("Select a crafting recipe").addOptions(aData))],
        };

        await interaction.reply(response);
      }
    }

    if (interaction.commandName === "crafterregister") {
      if (interaction.member.roles.cache.has(process.env.ROLE_ID)) {
        const iRecipe = interaction.options.get("recipe_name").value;
        const sCrafter = interaction.options.get("crafting_character").value;

        await crafterList.addCrafter(iRecipe, sCrafter, interaction);
      } else {
        const response = {
          content: "You do not have the required role to use this command.",
          ephemeral: true,
        };

        await interaction.reply(response);
      }
    }

    if (interaction.commandName === "search") {
      const chance = Math.random();

      const response =
        chance <= 0.05
          ? {
              content: "You have found her! As a reward for your unwavering commitment to the cause you are awarded with an Iron Cross.",
              ephemeral: true,
            }
          : {
              content: "You have found nothing. Perhaps this was all just a hoax?",
              ephemeral: true,
            };

      await interaction.reply(response);
    }
  }

  if (interaction.isStringSelectMenu()) {
    if (interaction.customId === "recipeSelect") {
      await crafterList.getCrafters(interaction.values[0], interaction);
    }

    if (interaction.customId === "jewelTypeSelect") {
      const aData = await recipeList.getJcRecipesByColor(interaction.values[0], interaction);

      if (aData.length != 0) {
        const response = {
          content: "Please select a recipe:",
          ephemeral: true,
          components: [new ActionRowBuilder().addComponents(new StringSelectMenuBuilder().setCustomId("recipeSelect").setPlaceholder("Select a jewel recipe").addOptions(aData))],
        };
        await interaction.reply(response);
      } else {
        const response = {
          content: "No recipes found in the selected Category.",
          ephemeral: true,
        };
        await interaction.reply(response);
      }
    }
  }
});

recipeList.getProfessionRecipes().then((aData) => {
  this.aData = aData;
  const commands = [
    {
      name: "craftersearch",
      description: "Search for a crafter",
      options: [
        // {
        //   name: "recipe_name",
        //   description: "recipe name",
        //   type: 4,
        //   required: true,
        //   choices: this.aData,
        // },
        {
          name: "recipe_profession",
          description: "Profession of the recipe",
          type: 3,
          required: true,
          choices: [
            {
              name: "Alchemy",
              value: "ac",
            },
            {
              name: "Blacksmithing",
              value: "bs",
            },
            {
              name: "Leatherworking",
              value: "lw",
            },
            {
              name: "Tailoring",
              value: "tr",
            },
            {
              name: "Engineering",
              value: "en",
            },
            {
              name: "Jewelcrafting - Red",
              value: "jc-red",
            },
            {
              name: "Jewelcrafting - Blue",
              value: "jc-blue",
            },
            {
              name: "Jewelcrafting - Yellow",
              value: "jc-yellow",
            },
            {
              name: "Jewelcrafting - Orange",
              value: "jc-orange",
            },
            {
              name: "Jewelcrafting - Purple",
              value: "jc-purple",
            },
            {
              name: "Jewelcrafting - Green",
              value: "jc-green",
            },
            {
              name: "Enchanting",
              value: "de",
            },
          ],
        },
      ],
    },
    {
      name: "crafterregister",
      description: "Register yourself as a crafter",
      options: [
        {
          name: "recipe_name",
          description: "Name of the recipe you are able to craft",
          type: 4,
          required: true,
          choices: this.aData,
        },
        {
          name: "crafting_character",
          description: "Name of your character",
          type: 3,
          required: true,
        },
      ],
    },
    {
      name: "search",
      description: "You got a call regarding suspicious noise in the attic. Want to take a look?",
    },
  ];

  const rest = new REST({ version: "10" }).setToken(process.env.TOKEN);

  (async () => {
    try {
      console.log("Registering Slash commands...");
      const data = await rest.put(Routes.applicationGuildCommands(process.env.CLIENT_ID, process.env.GUILD_ID), { body: commands });
      console.log("Slash commands were registered");
    } catch (error) {
      console.log(`There was an error: ${error}`);
    }
  })();
});

client.login(process.env.TOKEN);
