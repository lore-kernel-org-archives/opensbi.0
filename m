From: Ben Dooks <ben.dooks@codethink.co.uk>
Date: Tue, 4 Jul 2023 09:48:46 +0100
Subject: OpenSBI v1.3 Released
In-Reply-To: <CAAhSdy0S7UWzroJV04w4xfQvcaXoQ_a7zXfT9aLaYT5kWWPJ=Q@mail.gmail.com>
References: <CAAhSdy0S7UWzroJV04w4xfQvcaXoQ_a7zXfT9aLaYT5kWWPJ=Q@mail.gmail.com>
Message-ID: <1017d861-64e0-f7fa-409a-6208dfc6afdc@codethink.co.uk>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 23/06/2023 08:48, Anup Patel wrote:
> Hi All,
> 
> The OpenSBI v1.3 is now available on GitHub at:
> https://github.com/riscv-software-src/opensbi/releases
> 
> This release has:
> 
> * Allow platform to influence cold boot HART selection
> * Starfive JH7110 platform support
> * Split RX and RW firmware regions
> * Advertise nonretentive suspend for allwinner D1 platform
> * Byteorder/endianness conversion macros
> * SBI debug console extension (Experimental)
> * Configure the PMA regions for RZ/Five platform
> * SBI system suspend extension (Experimental)
> * SBI PMU platform firmware events (Experimental)
> * SBI CPPC extension (Experimental)
> * Optimized remote TLB flushes
> * Simple heap for boot time memory allocations
> * Bring back no-map DT property for reserved memory nodes
> 
> Overall, this release mainly adds new SBI extensions along
> with other improvements.
> 
> Many thanks to everyone who has contributed to this release.
>

Did the DesignWare GPIO driver get overlooked for this?

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


