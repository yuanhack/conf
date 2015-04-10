git filter-branch --commit-filter '
		GIT_AUTHOR_NAME="yuanhack";
		GIT_AUTHOR_EMAIL="yuanhack@163.com";
		git commit-tree "$@"; ' HEAD
