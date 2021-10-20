From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Wed, 20 Oct 2021 12:32:40 +0100
Subject: [PATCH 1/1] dt-bindings: T-HEAD CLINT
In-Reply-To: <CAAhSdy22y3gWM0Y9x7m84CdmtHKo7VsDC4+ZDY7+mhkJ9HcYyA@mail.gmail.com>
References: <20211020093603.28653-1-heinrich.schuchardt@canonical.com>
 <CAAhSdy22y3gWM0Y9x7m84CdmtHKo7VsDC4+ZDY7+mhkJ9HcYyA@mail.gmail.com>
Message-ID: <D1622375-A6BE-4B45-AD99-E4476D603E96@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 20 Oct 2021, at 12:27, Anup Patel <anup@brainfault.org> wrote:
> 
> On Wed, Oct 20, 2021 at 3:06 PM Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
>> 
>> The CLINT in the T-HEAD 9xx CPUs is similar to the SiFive CLINT but does
>> not support 64bit mmio access to the MTIMER device.
>> 
>> OpenSBI currently uses a property 'clint,has-no-64bit-mmio' to indicate the
>> restriction and the "sifive,cling0" compatible string. An OpenSBI
>> patch suggested to use "reg-io-width = <4>;" as the reg-io-width property
>> is generally used in the devicetree schema for such a condition.
>> 
>> As the design is not SiFive based it is preferable to apply a compatible
>> string identifying T-HEAD instead.
>> 
>> Add a new yaml file describing the T-HEAD CLINT.
>> 
>> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>> ---
>> @Palmer, @Anup
>> I copied you as maintainers from sifive,clint.yaml. Please, indicate if
>> this should be changed.
>> 
>> For the prior discussion see:
>> https://lore.kernel.org/all/20211015100941.17621-1-heinrich.schuchardt at canonical.com/
>> https://lore.kernel.org/all/20211015120735.27972-1-heinrich.schuchardt at canonical.com/
>> 
>> A release candidate of the ACLINT specification is available at
>> https://github.com/riscv/riscv-aclint/releases
> 
> T-HEAD supporting only 32bit accesses to MTIME and MTIMECMP
> registers are totally allowed. The RISC-V privileged specification does
> not enforce RV64 platforms to support 64bit accesses to MTIME and
> MTIMECMP registers

It does. See [1].

Jess

[1] https://github.com/riscv/riscv-isa-manual/commit/50694a2c0d5393690a9e0c8d309cf064f6c8c0e4


