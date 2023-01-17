From: Rob Herring <robh@kernel.org>
Date: Tue, 17 Jan 2023 13:50:11 -0600
Subject: [PATCH v5] dt-bindings: riscv: add SBI PMU event mappings
In-Reply-To: <20230113205435.122712-1-conor@kernel.org>
References: <20230113205435.122712-1-conor@kernel.org>
Message-ID: <167398500960.3526866.18235571341667319487.robh@kernel.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


On Fri, 13 Jan 2023 20:54:35 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The SBI PMU extension requires a firmware to be aware of the event to
> counter/mhpmevent mappings supported by the hardware. OpenSBI may use
> DeviceTree to describe the PMU mappings. This binding is currently
> described in markdown in OpenSBI (since v1.0 in Dec 2021) & used by QEMU
> since v7.2.0.
> 
> Import the binding for use while validating dtb dumps from QEMU and
> upcoming hardware (eg JH7110 SoC) that will make use of the event
> mapping.
> 
> Link: https://github.com/riscv-software-src/opensbi/blob/master/docs/pmu_support.md
> Link: https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc # Performance Monitoring Unit Extension
> Co-developed-by: Atish Patra <atishp@rivosinc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes in v5:
> - Remove the word hook from top level description & reword some of the
>   statements that sound clumsy when removed from the context of OpenSBI.
> 
> Changes in v4:
> - A bunch of minor description/comment changes suggested by Drew
> 
> Changes in v3:
> - align descriptions to SBI spec (and fix a misinterpretation of mine)
> - switch to a nested items description, since the descriptions are for
>   the elements of each entry, not the entries themselves
> 
> Changes in v2:
> - use the schema mechanism for dependancies between properties
> - +CC perf maintainers...
> - move the matrix element descriptions into regular item descriptions
>   rather than doing so freeform in the property description
> - drop some description text that no longer applies since changes were
>   made to the SBI spec
> - drop mention of the "generic platform" which is OpenSBI specific
> - drop the min/max items from the matrices, they don't appear to be
>   needed?
> 
> OpenSBI is BSD-2-Clause licensed, hence the license here.
> ---
>  .../devicetree/bindings/perf/riscv,pmu.yaml   | 161 ++++++++++++++++++
>  1 file changed, 161 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/riscv,pmu.yaml
> 

Applied, thanks!

