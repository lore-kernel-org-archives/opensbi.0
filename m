From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 10 Dec 2024 12:34:00 -0600
Subject: [PATCH v2 1/4] lib: sbi: sse: return an error value from
 sse_event_get()
In-Reply-To: <20241210170553.1034872-2-cleger@rivosinc.com>
References: <20241210170553.1034872-1-cleger@rivosinc.com>
 <20241210170553.1034872-2-cleger@rivosinc.com>
Message-ID: <53c42ae1-6a84-49e4-b4f9-dae4f346eadd@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-12-10 11:05 AM, Cl?ment L?ger wrote:
> Since event support will be checked in the next commits, return a value
> from sse_event_get() to allow propagating it. This will be used to
> report SBI_ERR_NOT_SUPPORTED when an event isn't supported.
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
>  lib/sbi/sbi_sse.c | 69 ++++++++++++++++++++++++-----------------------
>  1 file changed, 35 insertions(+), 34 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


