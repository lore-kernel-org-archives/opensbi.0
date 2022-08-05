From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 5 Aug 2022 08:22:18 +0200
Subject: [PATCH v7 00/17] OpenSBI Kconfig Support
In-Reply-To: <20220804143106.64599-1-apatel@ventanamicro.com>
References: <20220804143106.64599-1-apatel@ventanamicro.com>
Message-ID: <20220805062218.5dyhkttzkcplhcr3@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 04, 2022 at 08:00:49PM +0530, Anup Patel wrote:
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
> These patches can also be found in the kconfig_v7 branch at:
> https://github.com/avpatel/opensbi.git

Hi Anup,

The series looks good to me. I don't think I'll go line by line through
the makefile changes because testing shows that the build result is the
same after as before.

Thanks,
drew

