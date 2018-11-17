[![Build Status](https://dev.azure.com/Valks-Peachpie/peachpie-wordpress-template/_apis/build/status/Valks.peachpie-wordpress-template)](https://dev.azure.com/Valks-Peachpie/peachpie-wordpress-template/_build/latest?definitionId=1)

This is a sample template for a peachpie site running Wordpress

A few things of note:

- If your site needs to scan for php files then you need to copy the php files to the output folder. Use the Library template for making Patches, Plugins and Theme modules.
- I recommend adding modules (plugins, themes, patches) as sub-modules to make management easier.
- The peachpie version is configured in Common.props but for libraries you have to set the SDK version (look at the <Project Sdk=> near the top of the .msbuildproj file)