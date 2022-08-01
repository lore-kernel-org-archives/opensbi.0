From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 1 Aug 2022 13:35:45 +0200
Subject: [PATCH v4 00/15] OpenSBI Kconfig Support
In-Reply-To: <20220731045653.165058-1-apatel@ventanamicro.com>
References: <20220731045653.165058-1-apatel@ventanamicro.com>
Message-ID: <20220801113545.wyy2eyndgcveoatv@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jul 31, 2022 at 10:26:38AM +0530, Anup Patel wrote:
> In future, we will see more drivers in OpenSBI for system reset, serial port,
> power management, etc platform specific devices. We need platform specific
> compile time configuration to allow users control the size of OpenSBI generic
> firmware binaries by only enabling desired drivers. In other words, users
> should be allowed to restrict the set of RISC-V platforms on which OpenSBI
> generic firmwares built by them can run.
> 
> To address above, we add Kconfig support for OpenSBI platforms using the
> Kconfiglib project which is a standalone kconfig parser.
> 
> To try OpenSBI Kconfig support with generic platform, here are few
> example commands:
> make PLATFORM=generic             <-- builds OpenSBI using "defconfig"
> make PLATFORM=generic menuconfig  <-- launches graphical interface for changes
> 
> These patches can also be found in the kconfig_v4 branch at:
> https://github.com/avpatel/opensbi.git
> 
> Changes since v3:
>  - Strip down the Kconfiglib sources added by PATCH1
>  - Removed extra "." in the top-level Makefile updated by PATCH2
> 
> Changes since v2:
>  - Use $(FOO) instead of $FOO to access FOO environment variable in
>    Kconfig files.
>  - Added a new PATCH1 to include Kconfiglib v14.1.0 sources under
>    the scripts directory of OpenSBI.
> 
> Changes since v1:
>  - Fix SPDX license specifier in new Kconfig files
>

Hi Anup,

I played with this a bit and noticed a new compiler warning when compiling
with clang.

...
 GEN-DEP   platform/generic/platform_override_modules.dep
 GEN-DEP   platform/generic/platform_override_modules.dep
 CC-DEP    platform/generic/platform.dep
/home/drew/code/github/opensbi/platform/generic/platform.c:10:10: fatal error: 'libfdt.h' file not found
#include <libfdt.h>
         ^~~~~~~~~~
1 error generated.
... 

I also noticed a bunch of directories and empty .h files (including
libfdt.h) get added to build/platform/generic/kconfig/. That seems
like a bug.

I also tested the new PLATFORM_DEFCONFIG make variable. I found I needed
to specify a defconfig file by a relative path to
platform/$PLATFORM/configs/. I think it would be more convenient if
the path could be relative to the root where 'make' is run. And, also
nice would be if it could be an absolute path. Currently an absolute path
is still assumed to be relative to platform/$PLATFORM/configs/ resulting
in something like platform/$PLATFORM/configs//$ABSOLUTE_PATH

Finally, I find it a bit strange that we can now specifically configure
the '"Generic" version 0.1' platform type but still end up with a
'"Generic" version 0.1' platform type. I think we should allow, or
even enforce, configured generic platforms to have new names and
versions.

Thanks,
drew

