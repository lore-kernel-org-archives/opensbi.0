From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Oct 2021 13:13:14 +0200
Subject: [PATCH v6] Makefile: Add build time and compiler info string
In-Reply-To: <20211020094406.1393760-1-anup.patel@wdc.com> (Anup Patel's
 message of "Wed, 20 Oct 2021 15:14:06 +0530")
References: <20211020094406.1393760-1-anup.patel@wdc.com>
Message-ID: <87pms06jat.fsf@dell.be.48ers.dk>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>>>>> "Anup" == Anup Patel <anup.patel@wdc.com> writes:

 > From: Wei Fu <wefu@redhat.com>
 > When we are doing opensbi development, we want to know the build time
 > and compiler info for debug purpose.

 > To enable this message, please add "BUILD_INFO=y", like:

 > ```
 > make BUILD_INFO=y
 > ```

 > NOTE: Using `BUILD_INFO=y` without specifying SOURCE_DATE_EPOCH will
 > violate "reproducible builds". So it's ONLY for development and debug
 > purpose, and should NOT be used in a product which follows "reproducible
 > builds".

 > Signed-off-by: Wei Fu <wefu@redhat.com>
 > Reviewed-by: Anup Patel <anup.patel@wdc.com>
 > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
 > ---
 > Changes since v5:
 >  - BUILD_DATE_EPOCH is non-standard name so rename it back to
 >    SOURCE_DATE_EPOCH
 >  - Updated README.md and commit description to clearly state when
 >    BUILD_INFO=y violates reprodcible builds

..

 > +# Build Info:
 > +# OPENSBI_BUILD_TIME_STAMP -- the compilation time stamp
 > +# OPENSBI_BUILD_COMPILER_VERSION -- the compiler version info
 > +BUILD_INFO ?= n
 > +ifeq ($(BUILD_INFO),y)
 > +OPENSBI_BUILD_DATE_FMT = +%Y-%m-%d %H:%M:%S %z
 > +ifdef SOURCE_DATE_EPOCH
 > +	OPENSBI_BUILD_TIME_STAMP ?= $(shell date -u -d "@$(SOURCE_DATE_EPOCH)" \
 > +		"$(OPENSBI_BUILD_DATE_FMT)" 2>/dev/null || \
 > +		date -u -r "$(SOURCE_DATE_EPOCH)" \
 > +		"$(OPENSBI_BUILD_DATE_FMT)" 2>/dev/null || \
 > +		date -u "$(OPENSBI_BUILD_DATE_FMT)")

What is this date -r fallback about? According to the spec,
SOURCE_DATE_EPOCH is always a unix timestamp, never a filename:

https://reproducible-builds.org/specs/source-date-epoch/

With that dropped we could get rid of some of the repeated code, E.G.:

OPENSBI_BUILD_TIME_STAMP ?= \
  $(shell date $(if $(SOURCE_DATE_EPOCH),-u -d "@$(SOURCE_DATE_EPOCH)") "$(OPENSBI_BUILD_DATE_FMT)")

-- 
Bye, Peter Korsgaard

