From: Xiang W <wxjstz@126.com>
Date: Thu, 20 Mar 2025 09:26:49 +0800
Subject: [PATCH] Makefile: Avoid repeated evaluation of shell commands
In-Reply-To: <20250313035755.3796610-1-samuel.holland@sifive.com>
References: <20250313035755.3796610-1-samuel.holland@sifive.com>
Message-ID: <5cf3eee947e4f3a5bf97d0c529d13831ac60abba.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2025-03-12?? 20:57 -0700?Samuel Holland???
> Recursively expanded variables (defined with '=') are expanded at
> evaluation time. These version information variables are evaluated
> inside a recipe as part of GENFLAGS. As a result, the shell commands
> are executed separately for each compiler invocation. Convert the
> version information variables to be simply expanded, so the shell
> commands are executed only once, at Makefile evaluation time. This
> speeds up the build by as much as 75%.
> 
> A separate check is needed to maintain the behavior of preferring the
> value of OPENSBI_BUILD_TIME_STAMP from the environment.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
LGTM

Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> 
> ?Makefile | 14 ++++++++------
> ?1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 419ce66b..c1a13037 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -94,11 +94,11 @@ OPENSBI_VERSION_MINOR=`grep "define OPENSBI_VERSION_MINOR" $(include_dir)/sbi/sb
> ?OPENSBI_VERSION_GIT=
> ?
> ?# Detect 'git' presence before issuing 'git' commands
> -GIT_AVAIL=$(shell command -v git 2> /dev/null)
> +GIT_AVAIL := $(shell command -v git 2> /dev/null)
> ?ifneq ($(GIT_AVAIL),)
> -GIT_DIR=$(shell git rev-parse --git-dir 2> /dev/null)
> +GIT_DIR := $(shell git rev-parse --git-dir 2> /dev/null)
> ?ifneq ($(GIT_DIR),)
> -OPENSBI_VERSION_GIT=$(shell if [ -d $(GIT_DIR) ]; then git describe 2> /dev/null; fi)
> +OPENSBI_VERSION_GIT := $(shell if [ -d $(GIT_DIR) ]; then git describe 2> /dev/null; fi)
> ?endif
> ?endif
> ?
> @@ -202,16 +202,18 @@ endif
> ?BUILD_INFO ?= n
> ?ifeq ($(BUILD_INFO),y)
> ?OPENSBI_BUILD_DATE_FMT = +%Y-%m-%d %H:%M:%S %z
> +ifndef OPENSBI_BUILD_TIME_STAMP
> ?ifdef SOURCE_DATE_EPOCH
> -	OPENSBI_BUILD_TIME_STAMP ?= $(shell date -u -d "@$(SOURCE_DATE_EPOCH)" \
> +	OPENSBI_BUILD_TIME_STAMP := $(shell date -u -d "@$(SOURCE_DATE_EPOCH)" \
> ?		"$(OPENSBI_BUILD_DATE_FMT)" 2>/dev/null || \
> ?		date -u -r "$(SOURCE_DATE_EPOCH)" \
> ?		"$(OPENSBI_BUILD_DATE_FMT)" 2>/dev/null || \
> ?		date -u "$(OPENSBI_BUILD_DATE_FMT)")
> ?else
> -	OPENSBI_BUILD_TIME_STAMP ?= $(shell date "$(OPENSBI_BUILD_DATE_FMT)")
> +	OPENSBI_BUILD_TIME_STAMP := $(shell date "$(OPENSBI_BUILD_DATE_FMT)")
> ?endif
> -OPENSBI_BUILD_COMPILER_VERSION=$(shell $(CC) -v 2>&1 | grep ' version ' | \
> +endif
> +OPENSBI_BUILD_COMPILER_VERSION := $(shell $(CC) -v 2>&1 | grep ' version ' | \
> ?	sed 's/[[:space:]]*$$//')
> ?endif
> ?
> -- 
> 2.47.2
> 


