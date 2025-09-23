{pkgs, config, inputs, ...}: 
{
   environment.systemPackages = with pkgs; [

    #  IRC clients
    irssi
    tiny
    # Latex Replacements
    typst

    # Tor
    tor
   ]; 

}
