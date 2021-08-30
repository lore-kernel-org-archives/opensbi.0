From: Anup Patel <Anup.Patel@wdc.com>
Date: Mon, 30 Aug 2021 03:40:00 +0000
Subject: [PATCH] lib: sbi: Correct typo in faults delegation CSR name
In-Reply-To: <20210826095417.135448-1-rpathak@ventanamicro.com>
References: <20210826095417.135448-1-rpathak@ventanamicro.com>
Message-ID: <3E07CD9C-7894-4609-936A-02388F877468@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



?On 26/08/21, 9:13 PM, "opensbi on behalf of Rahul Pathak" <opensbi-bounces at lists.infradead.org on behalf of rpathak@ventanamicro.com> wrote:

    Correcting the name of faults delegation CSR
    %s/mfdeleg/medeleg

    Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup
    ---
     lib/sbi/sbi_platform.c | 2 +-
     1 file changed, 1 insertion(+), 1 deletion(-)

    diff --git a/lib/sbi/sbi_platform.c b/lib/sbi/sbi_platform.c
    index e8b94a3..99bd8f5 100644
    --- a/lib/sbi/sbi_platform.c
    +++ b/lib/sbi/sbi_platform.c
    @@ -20,7 +20,7 @@ static inline char *sbi_platform_feature_id2string(unsigned long feature)

     	switch (feature) {
     	case SBI_PLATFORM_HAS_MFAULTS_DELEGATION:
    -		fstr = "mfdeleg";
    +		fstr = "medeleg";
     		break;
     	default:
     		break;
    -- 
    2.25.1


    -- 
    opensbi mailing list
    opensbi at lists.infradead.org
    http://lists.infradead.org/mailman/listinfo/opensbi

