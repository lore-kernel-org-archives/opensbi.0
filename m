From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Mon, 30 Oct 2023 18:41:52 +0200
Subject: [RFC 3/3] lib: sbi: enable seed access in S-mode
In-Reply-To: <20231028224959.95465-4-heinrich.schuchardt@canonical.com>
References: <20231028224959.95465-1-heinrich.schuchardt@canonical.com>
 <20231028224959.95465-4-heinrich.schuchardt@canonical.com>
Message-ID: <7d9bfb00-1f61-433a-a558-bd8f4e77399b@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/29/23 01:49, Heinrich Schuchardt wrote:
> If ISA extension Zkr is available, set
> 
>      mseccfg.sseed=1
>      mseccfg.useed=0
> 
> This enables access to the seed CSR in S-mode but not in U-mode.
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

Anup pointed me to a previous patch:

lib: sbi: Configure seed bits when MSECCFG is readable
https://patchwork.ozlabs.org/project/opensbi/patch/20230712083254.1585244-1-sameo at rivosinc.com/

Best regards

Heinrich

