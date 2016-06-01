# CHIRP Radio Mockups

## Commands

| **Command** | **Description** |
|-------------|-----------------|
| `inv serve` | Serve the site at localhost:8000 |
| `inv build` | Build the site |
| `inv publish` | Publish the site to GitHub Pages |

## Install Stylus and CoffeeScript support

If you want to use Stylus, you must first install Node.js.

On Mac (assuming you have Homebrew):

```
brew install node
```

On Linux, you can run something like this (you may want to change the 6.2.0 to whatever the latest version number is):

```
wget -O nodejs.tar.xz https://nodejs.org/dist/v6.2.0/node-v6.2.0-linux-x64.tar.xz
sudo tar -C /usr/local --strip-components 1 -xJf nodejs.tar.xz
```

Once Node.js has been installed, you can use npm to install the CoffeeScript and Stylus packages:

```
npm install -g stylus coffee-script
```
chirpradio-mockups
