From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 21 Dec 2022 23:33:40 +0800
Subject: [PATCH v1] docs: pmu: fix binding example
In-Reply-To: <20221221135939.266377-1-conor@kernel.org>
References: <20221221135939.266377-1-conor@kernel.org>
Message-ID: <CAEUhbmWXo3Xoz2AxnNeEXZSn21Sg=7eu7z65qtp+ZYh9vc1GSQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 21, 2022 at 10:14 PM Conor Dooley <conor@kernel.org> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The first PMU binding example does not terminate properties with a ;,
> which is invalid. Noticed while converting the binding to yaml.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  docs/pmu_support.md | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

