From: Yangyu Chen <cyy@cyyself.name>
Date: Thu, 9 May 2024 18:06:49 +0800
Subject: [PATCH 0/2] platform: generic: thead: Add Canaan K230 PMU support
In-Reply-To: <tencent_0B636642B81B2FF820053DB5571D87701709@qq.com>
References: <tencent_0B636642B81B2FF820053DB5571D87701709@qq.com>
Message-ID: <tencent_3663016E5D4C59884963361FAEA09EF6A006@qq.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Ping. I think this patch is ready.

On 2024/4/21 23:50, Yangyu Chen wrote:
> Since dt-binding for the Canaan Kendryte K230 SoC has been merged into the
> linux kernel. It's time to add its support in OpenSBI to probe it has
> T-Head PMU. As this SoC is the first chip with RISC-V Vector 1.0 in the
> market, adding PMU support for profiling is essential.
> 
> This patchset adds T-Head PMU support for Canaan Kendryte K230 SoC by
> adding a K230 SoC compatible string to the thead_generic_match. Also, do
> some clean-up to separate the T-Head PMU Errata handling that no longer
> enables T-Head PMU by default for all the T-Head Chips, as newer cores may
> feature Sscofpmf.
> 
> Yangyu Chen (2):
>    platform: generic: thead: separate T-Head PMU Errata
>    platform: generic: thead: add Canaan Kendryte K230
> 
>   platform/generic/include/thead/c9xx_errata.h |  1 +
>   platform/generic/thead/thead-generic.c       | 13 +++++++++++--
>   2 files changed, 12 insertions(+), 2 deletions(-)
> 


