{
	pkg,
		config,
		...
}: {
	programs.direnv = {
		enable = true;
		enableBashIntegration = true;
		direnvcExtra = ''
			: "${XDG_CACHE_HOME:="${HOME}/.cache"}"
			declare -A direnv_layout_dirs
			direnv_layout_dir() {
				local hash path
					echo "${direnv_layout_dirs[$PWD]:=$(
							hash="$(sha1sum - <<< "$PWD" | head -c40)"
							path="${PWD//[^a-zA-Z0-9]/-}"
							echo "${XDG_CACHE_HOME}/direnv/layouts/${hash}${path}"
							)}"
			}
		'';
		nix-direnv = {
			enable = true;
			package = pkgs.nix-direnv;
		};
	};

	programs.mtr.enable = true;
	programs.gnupg = {
		agent = {
			enable = true;
			enableSSHSupport = true;
			settings = {
				default-cache-ttl = 86400;
				default-cache-ttl-ssh = 86400;
				max-cache-ttl = 2592000;
				max-cache-ttl-ssh = 2592000;
			};
		};
	};
}
