[![Build Status](https://dev.azure.com/Valks-Peachpie/Peachpie.Wordpress.Template/_apis/build/status/PeachpieModules.Peachpie.Wordpress.Template?branchName=master)](https://dev.azure.com/Valks-Peachpie/Peachpie.Wordpress.Template/_build/latest?definitionId=8&branchName=master) [![Deployment Status](https://vsrm.dev.azure.com/Valks-Peachpie/_apis/public/Release/badge/02942101-7d18-4f0b-bee1-a65d03c32d6c/7/7)](https://peachpie-wordpress-template.azurewebsites.net/)

This is a sample template for a peachpie site running Wordpress

A few things of note:

- If your site needs to scan for php files then you need to copy the php files to the output folder. Use the Library template for making Patches, Plugins and Theme modules.
- I recommend adding modules (plugins, themes, patches) as sub-modules to make management easier.
- For the server you only need to add the Peachpie.Wordpress.AspNetCore package, the version is configured in Common.props
- For libraries the peachpie version is manually set in the SDK version (look at the <Project Sdk=> near the top of the .csproj file)