From: Rob Herring <robh@kernel.org>
Date: Wed, 20 Oct 2021 08:50:23 -0500
Subject: [PATCH 1/1] dt-bindings: T-HEAD CLINT
In-Reply-To: <20211020093603.28653-1-heinrich.schuchardt@canonical.com>
References: <20211020093603.28653-1-heinrich.schuchardt@canonical.com>
Message-ID: <1634737823.662456.2259916.nullmailer@robh.at.kernel.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 20 Oct 2021 11:36:03 +0200, Heinrich Schuchardt wrote:
> The CLINT in the T-HEAD 9xx CPUs is similar to the SiFive CLINT but does
> not support 64bit mmio access to the MTIMER device.
> 
> OpenSBI currently uses a property 'clint,has-no-64bit-mmio' to indicate the
> restriction and the "sifive,cling0" compatible string. An OpenSBI
> patch suggested to use "reg-io-width = <4>;" as the reg-io-width property
> is generally used in the devicetree schema for such a condition.
> 
> As the design is not SiFive based it is preferable to apply a compatible
> string identifying T-HEAD instead.
> 
> Add a new yaml file describing the T-HEAD CLINT.
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
> @Palmer, @Anup
> I copied you as maintainers from sifive,clint.yaml. Please, indicate if
> this should be changed.
> 
> For the prior discussion see:
> https://lore.kernel.org/all/20211015100941.17621-1-heinrich.schuchardt at canonical.com/
> https://lore.kernel.org/all/20211015120735.27972-1-heinrich.schuchardt at canonical.com/
> 
> A release candidate of the ACLINT specification is available at
> https://github.com/riscv/riscv-aclint/releases
> ---
>  .../bindings/timer/thead,clint.yaml           | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/thead,clint.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/timer/thead,clint.yaml: properties:compatible:items: 'oneOf' conditional failed, one must be fixed:
	[{'const': ['allwinner,sun20i-d1-clint']}, {'const': ['thead,clint0']}] is not of type 'object'
	['allwinner,sun20i-d1-clint'] is not of type 'string'
	['thead,clint0'] is not of type 'string'
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/timer/thead,clint.yaml: ignoring, error in schema: properties: compatible: items
warning: no schema found in file: ./Documentation/devicetree/bindings/timer/thead,clint.yaml
Documentation/devicetree/bindings/timer/thead,clint.example.dt.yaml:0:0: /example-0/timer at 2000000: failed to match any schema with compatible: ['allwinner,sun20i-d1-clint', 'thead,clint0']
Documentation/devicetree/bindings/timer/thead,clint.example.dt.yaml:0:0: /example-0/timer at 2000000: failed to match any schema with compatible: ['allwinner,sun20i-d1-clint', 'thead,clint0']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1543771

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


