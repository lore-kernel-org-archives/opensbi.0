From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Fri, 15 Oct 2021 13:54:23 +0200
Subject: [PATCH 1/1] dt-bindings: reg-io-width for SiFive CLINT
In-Reply-To: <CAEUhbmUSmi9mbiHpatBjGgRjrtyJPms9BRmyBPs5BWeVb7n1Nw@mail.gmail.com>
References: <20211015100941.17621-1-heinrich.schuchardt@canonical.com>
 <CAEUhbmUSmi9mbiHpatBjGgRjrtyJPms9BRmyBPs5BWeVb7n1Nw@mail.gmail.com>
Message-ID: <49af3dc8-0d1e-e82f-6df2-2bf8338acd3a@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/15/21 12:14, Bin Meng wrote:
> On Fri, Oct 15, 2021 at 6:09 PM Heinrich Schuchardt
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
>>
>> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>> ---
>>   Documentation/devicetree/bindings/timer/sifive,clint.yaml | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>> index a35952f48742..266012d887b5 100644
>> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>> @@ -41,6 +41,13 @@ properties:
>>     reg:
>>       maxItems: 1
>>
>> +  reg-io-width:
>> +    description: |
>> +      Some CLINT implementations, e.g. on the T-HEAD 9xx, only support
>> +      32bit access for MTIMER.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    const: 4
> 
> But this is not a "sifive,clint" anyway. Should there be a new
> dt-bindings for T-Head clint variant?

I assume by new dt-bindings variant you mean: Add a new compatible 
string in Documentation/devicetree/bindings/timer/sifive,clint.yaml.

The vendor Debian image uses:
compatible = "{allwinner,sun20i-d1-clint", "sifive,clint0"};

We could add this diff in a future version of the patch:

--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -26,6 +26,7 @@ properties:
        - enum:
            - sifive,fu540-c000-clint
            - canaan,k210-clint
+          - allwinner,sun20i-d1-clint
        - const: sifive,clint0

      description:
@@ -33,10 +34,10 @@ properties:
        Supported compatible strings are -
        "sifive,fu540-c000-clint" for the SiFive CLINT v0 as integrated
        onto the SiFive FU540 chip, "canaan,k210-clint" for the SiFive
-      CLINT v0 as integrated onto the Canaan Kendryte K210 chip, and
+      CLINT v0 as integrated onto the Canaan Kendryte K210 chip,
        "sifive,clint0" for the SiFive CLINT v0 IP block with no chip
-      integration tweaks.
-      Please refer to sifive-blocks-ip-versioning.txt for details
+      integration tweaks, and "allwinner,sun20i-d1-clint" for the Allwinner
+      D1. Please refer to sifive-blocks-ip-versioning.txt for details

    reg:
      maxItems: 1

Best regards

Heinrich

> 
>> +
>>     interrupts-extended:
>>       minItems: 1
> 
> Regards,
> Bin
> 


