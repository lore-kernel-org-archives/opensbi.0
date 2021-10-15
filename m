From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Fri, 15 Oct 2021 14:42:53 +0200
Subject: [PATCH 1/1] dt-bindings: reg-io-width for SiFive CLINT
In-Reply-To: <D976B0F9-6AE4-4C04-8D52-75B24D6E4359@jrtc27.com>
References: <20211015100941.17621-1-heinrich.schuchardt@canonical.com>
 <CAEUhbmUSmi9mbiHpatBjGgRjrtyJPms9BRmyBPs5BWeVb7n1Nw@mail.gmail.com>
 <49af3dc8-0d1e-e82f-6df2-2bf8338acd3a@canonical.com>
 <D976B0F9-6AE4-4C04-8D52-75B24D6E4359@jrtc27.com>
Message-ID: <081176c0-5938-df1a-7828-d9ee1c270cbf@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/15/21 14:15, Jessica Clarke wrote:
> On 15 Oct 2021, at 12:54, Heinrich Schuchardt <heinrich.schuchardt@canonical.com> wrote:
>>
>> On 10/15/21 12:14, Bin Meng wrote:
>>> On Fri, Oct 15, 2021 at 6:09 PM Heinrich Schuchardt
>>> <heinrich.schuchardt@canonical.com> wrote:
>>>>
>>>> The CLINT in the T-HEAD 9xx processors do not support 64bit mmio access to
>>>> the MTIMER device. The current schema does not allow to specify this.
>>>>
>>>> OpenSBI currently uses a property 'clint,has-no-64bit-mmio' to indicate the
>>>> restriction. Samuael Holland suggested in
>>>> lib: utils/timer: Use standard property to specify 32-bit I/O
>>>> https://github.com/smaeul/opensbi/commit/b95e9cf7cf93b0af16fc89204378bc59ff30008e
>>>> to use "reg-io-width = <4>;" as the reg-io-width property is generally used
>>>> in the devicetree schema for such a condition.
>>>>
>>>> A release candidate of the ACLINT specification is available at
>>>> https://github.com/riscv/riscv-aclint/releases
>>>>
>>>> Add reg-io-width as optional property to the SiFive Core Local Interruptor.
>>>>
>>>> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>>>> ---
>>>>   Documentation/devicetree/bindings/timer/sifive,clint.yaml | 7 +++++++
>>>>   1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>>>> index a35952f48742..266012d887b5 100644
>>>> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>>>> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>>>> @@ -41,6 +41,13 @@ properties:
>>>>     reg:
>>>>       maxItems: 1
>>>>
>>>> +  reg-io-width:
>>>> +    description: |
>>>> +      Some CLINT implementations, e.g. on the T-HEAD 9xx, only support
>>>> +      32bit access for MTIMER.
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    const: 4
>>> But this is not a "sifive,clint" anyway. Should there be a new
>>> dt-bindings for T-Head clint variant?
>>
>> I assume by new dt-bindings variant you mean: Add a new compatible string in Documentation/devicetree/bindings/timer/sifive,clint.yaml.
>>
>> The vendor Debian image uses:
>> compatible = "{allwinner,sun20i-d1-clint", "sifive,clint0?};
> 
> I assume Bin means to stop calling it a sifive,clint0 and instead have
> something like
> 
>      "allwinner,sun20i-d1-clint", "thead,clint0"
> 
> as is being done for their non-conforming PLIC. It?s worth pointing out
> that the same is true here; the SiFive CLINT supports 64-bit accesses
> on RV64, so this is not compatible with a SiFive CLINT. Moreover, the
> RISC-V spec was clearly written in a way that intended 64-bit accesses
> to be supported for RV64, though was not completely explicit about
> that, which has now been resolved (see
> https://github.com/riscv/riscv-isa-manual/issues/639), so this CLINT
> violates the obvious intent of the pre-1.12 privileged specs (see
> Andrew?s message in the issue, which agrees with my reading).
> 
> Jess
> 

This comment is referring to the discussion in

https://lore.kernel.org/lkml/693a609c-4278-84ab-8a9b-448936bb13d0 at sholland.org/


