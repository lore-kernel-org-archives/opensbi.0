From: Jeff Law <jlaw@ventanamicro.com>
Date: Mon, 14 Aug 2023 07:06:28 -0600
Subject: [PATCH] Makefile: Force GNU hashing
In-Reply-To: <mvmwmxydqbn.fsf@suse.de>
References: <20230814043959.390101-1-mchitale@ventanamicro.com>
 <mvmwmxydqbn.fsf@suse.de>
Message-ID: <5c7a4dce-60fe-e61f-1596-20378d5204d1@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 8/14/23 01:40, Andreas Schwab wrote:
> On Aug 14 2023, Mayuresh Chitale wrote:
> 
>> The Yocto QA step verifies that binaries and DSOs use DT_GNU_HASH rather than
>> DT_HASH. If the linker is called directly, then we need to make sure to pass in
>> the hashing style.
> 
> Why does it matter?  The ultimate output is a flat binary.
It matters because the Yocto QA step will fail.  It doesn't affect the 
behavior of the resulting image though, IIRC.

Jeff

