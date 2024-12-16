From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon, 16 Dec 2024 15:55:09 -0600
Subject: [PATCH v4 4/5] lib: sbi: sse: return SBI_ENOTSUPP for unsupported
 events
In-Reply-To: <20241216212144.3379890-5-cleger@rivosinc.com>
References: <20241216212144.3379890-1-cleger@rivosinc.com>
 <20241216212144.3379890-5-cleger@rivosinc.com>
Message-ID: <28aeb813-36a1-4289-aa89-0c8c4fe2dab7@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-12-16 3:21 PM, Cl?ment L?ger wrote:
> If a standard event was not found in the list of events that are handled
> by harts but belongs to the standard event list defined by the
> specification, return SBI_ENOTSUPP. Without that, we can not
> distinguish a non implemented standard event from a non valid one.
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
>  lib/sbi/sbi_sse.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


