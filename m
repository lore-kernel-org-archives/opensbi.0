From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 2 Aug 2022 10:19:44 +0200
Subject: [PATCH v5 00/16] OpenSBI Kconfig Support
In-Reply-To: <20220802044132.280529-1-apatel@ventanamicro.com>
References: <20220802044132.280529-1-apatel@ventanamicro.com>
Message-ID: <20220802081944.gxl6iaufskxmsodv@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 02, 2022 at 10:11:16AM +0530, Anup Patel wrote:
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
> These patches can also be found in the kconfig_v5 branch at:
> https://github.com/avpatel/opensbi.git
> 
> Changes since v4:
>  - Added separate PATCH14 to allow user change generic platform
>    version and default name.
>  - Fixed libfdt compiler error using LLVM in PATCH12
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

Besides my whining about not being able to provide an absolute path to
PLATFORM_DEFCONFIG, this seems to work as advertised.

Tested-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

