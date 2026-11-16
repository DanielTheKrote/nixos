{ ... }: {
  imports = [ ../haus ];
  config.haus = {
    neovim.enable = true;
    chromium.enable = true;
  };
}