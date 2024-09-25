{ config, pkgs, ... }:

{
    environment.packages = with pkgs.vimPlugins; [
        neovim
        lightline.vim
        tokyonight.nvim
    ];

    programs.neovim = {
        enable = true;
        plugins = with pkgs.vimPlugins; [
            tokyonight-nvim
            lightline-vim
        ];
        extraConfig = ''
set laststatus=2
set number
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'background': 'dark'
      \ }
colorscheme tokyonight-night
        '';
    };
}