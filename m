From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Mon, 18 Oct 2021 09:30:13 +0200
Subject: [PATCH v2 1/1] dt-bindings: reg-io-width for SiFive CLINT
In-Reply-To: <CAAhSdy3JU6jitTWFk4CVRG5Xc7P7ueZzd=xmnKBNpx8eGaR6hw@mail.gmail.com>
References: <20211015120735.27972-1-heinrich.schuchardt@canonical.com>
 <CAAhSdy3JU6jitTWFk4CVRG5Xc7P7ueZzd=xmnKBNpx8eGaR6hw@mail.gmail.com>
Message-ID: <7361287f-9c07-8b76-d405-35f287ac1706@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/18/21 06:33, Anup Patel wrote:
> On Fri, Oct 15, 2021 at 5:37 PM Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
>>
>> The CLINT in the T-HEAD 9xx processors do not support 64bit mmio access to
>> the MTIMER device. The current schema does not allow to specify this.
>>
>> OpenSBI currently uses a property 'clint,has-no-64bit-mmio' to indicate the
>> restriction. Samuael Holland suggested in
>> lib: utils/timer: Use standard property to specify 32-bit I/O
>> https://github.com/smaeul/opensbi/commit/b95e9cf7cf93b0af16fc89204378bc59ff30008e
>> to use "reg-io-width = <4>;" as the reg-io-width property is generally used
>> in the devicetree schema for such a condition.
>>
>> A release candidate of the ACLINT specification is available at
>> https://github.com/riscv/riscv-aclint/releases
>>
>> Add reg-io-width as optional property to the SiFive Core Local Interruptor.
>> Add a new compatible string "allwinner,sun20i-d1-clint" for the CLINT of
>> the Allwinner D1 SoC.
>>
>> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>> ---
>>   .../devicetree/bindings/timer/sifive,clint.yaml     | 13 +++++++++++--
>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>> index a35952f48742..d3b4c6844e2f 100644
>> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>> @@ -26,6 +26,7 @@ properties:
>>         - enum:
>>             - sifive,fu540-c000-clint
>>             - canaan,k210-clint
>> +          - allwinner,sun20i-d1-clint
>>         - const: sifive,clint0
>>
>>       description:
>> @@ -33,14 +34,22 @@ properties:
>>         Supported compatible strings are -
>>         "sifive,fu540-c000-clint" for the SiFive CLINT v0 as integrated
>>         onto the SiFive FU540 chip, "canaan,k210-clint" for the SiFive
>> -      CLINT v0 as integrated onto the Canaan Kendryte K210 chip, and
>> -      "sifive,clint0" for the SiFive CLINT v0 IP block with no chip
>> +      CLINT v0 as integrated onto the Canaan Kendryte K210 chip,
>> +      "allwinner,sun20i-d1-clint" for the CLINT in the Allwinner D1 SoC,
>> +      and "sifive,clint0" for the SiFive CLINT v0 IP block with no chip
>>         integration tweaks.
>>         Please refer to sifive-blocks-ip-versioning.txt for details
>>
>>     reg:
>>       maxItems: 1
>>
>> +  reg-io-width:
>> +    description: |
>> +      Some CLINT implementations, e.g. on the T-HEAD 9xx, only support
>> +      32bit access for MTIMER.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    const: 4
>> +
> 
> Please drop the "reg-io-width" DT property.
> 
> Based on discussion on ACLINT MTIMER DT bindings, Rob suggested
> using implementation specific compatible string for detecting register IO
> width. We should follow the same strategy here as well.

Should we create a completely separated yaml document for 
"allwinner,sun20i-d1-clint", "thead,clint0"? Or should we integrate all 
in sifive,clint.yaml?

Best regards

Heinrich

> 
> Regards,
> Anup
> 
>>     interrupts-extended:
>>       minItems: 1
>>
>> --
>> 2.32.0
>>


