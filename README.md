# Starter Gift Box Script

A **Starter Gift Box** script that provides new players with a special gift box upon their first fly-in. Players can open the box to receive various items configured by the server admin. This adds a welcoming touch to your server, helping new players get started with some useful items.

## Features
- Customizable gift box items
- Supports **QBCore** framework
- Seamless integration with QB-Core for easy configuration

## Installation

Follow these steps to set up the Starter Gift Box script in your server:

1. **Download and Place the Script**
   - Download the script files and place them in your `[Standalone]` folder.

2. **Add the Gift Box Image to Inventory**
   - Copy the `giftbox.png` image (included with the files) into your inventory images folder.

3. **Configure the Gift Box in QB-Core**
   - Open `qb-core/shared/items.lua`.
   - Add the following line at the bottom of the file to define the gift box as a unique item:

     ```lua
     ['giftbox'] = {['name'] = 'giftbox', ['label'] = 'Starter Gift Box', ['weight'] = 0, ['type'] = 'item', ['image'] = 'giftbox.png', ['unique'] = true, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'A Present with various items'},
     ```

4. **Add the Gift Box as a Starter Item**
   - Open `qb-core/shared/main.lua`.
   - Locate `QBShared.StarterItems` and add this line to ensure the gift box is given to new players:

     ```lua
     ['giftbox'] = { amount = 1, item = 'giftbox' },
     ```

5. **Configure the Gift Box Contents**
   - Go to the config file for this script.
   - Customize the items you want to include in the gift box for your server.

## Support
For any questions or troubleshooting, feel free to reach out to me on discord ```_machooman_```

---

Enjoy providing your players with a welcoming gift on their first fly-in!

- Vyx
