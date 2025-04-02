# dotfiles
This repo contains the dotfile configuration for my setup.

To create a new dotfiles directory that maps to the system, create it in the repo and then descibe the link in the `link-manifest` file.

To connect the repo run `./repo link` to disconnect it run `./repo unlink`.

If you want to safely move files in link locations away run `./repo force-remove ./temp` which will move the files into the newly created `./temp` directory.
