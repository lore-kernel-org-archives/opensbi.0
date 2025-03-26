From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 25 Mar 2025 21:02:29 -0500
Subject: [PATCH v4] lib: sbi_mpxy: Change MPXY state as per-domain data
In-Reply-To: <20250325071314.3113941-1-alvinga@andestech.com>
References: <20250325071314.3113941-1-alvinga@andestech.com>
Message-ID: <221bc465-f41b-4ac0-861d-be831a920b7a@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2025-03-25 2:13 AM, Alvin Chang wrote:
> OpenSBI supports multiple supervisor domains run on same platform. When
> these supervisor domains want to communicate with OpenSBI through MPXY
> channels, they will allocate MPXY shared memory from their own memory
> regions. Therefore, the MPXY state data structure must be per-domain and
> per-hart data structure.
> 
> This commit registers per-domain MPXY state data in sbi_mpxy_init(). The
> original MPXY state allocated in scratch region is also removed. We also
> replace sbi_scratch_thishart_offset_ptr() macro as new
> sbi_domain_mpxy_state_thishart_ptr() macro which gets MPXY state from
> per-domain data.
> 
> Signed-off-by: Alvin Chang <alvinga@andestech.com>
> Reviewed-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> ---
> Changes in V4:
>     Rebase to master and apply Samuel's suggestions which improves memory usage
> 
> Changes in V3:
>     Apply Anup's suggestions to merge some of patches and drop unnecessary
>     modifications
> 
> Changes in V2:
>     Rebase to master
> ---
>  include/sbi/sbi_mpxy.h |  16 +++++++
>  lib/sbi/sbi_mpxy.c     | 102 +++++++++++++++++++++++++++++++----------
>  2 files changed, 95 insertions(+), 23 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


