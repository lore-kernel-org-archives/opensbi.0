From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Tue, 29 Nov 2022 10:44:41 +0000
Subject: [PATCH v2 4/6] lib: fix fdt_parse_plicsw_node()
In-Reply-To: <20221128091420.30391-5-heinrich.schuchardt@canonical.com>
References: <20221128091420.30391-1-heinrich.schuchardt@canonical.com>
 <20221128091420.30391-5-heinrich.schuchardt@canonical.com>
Message-ID: <Y4Ximb7MKOP0+5DG@APC323>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 28, 2022 at 10:14:18AM +0100, Heinrich Schuchardt wrote:
> cpu_offset and cpu_intc_offset must be int to detect failed invocations of
> fdt_node_offset_by_phandle() or fdt_parent_offset().
> 
> After determining cpu_offset we have to check this value and not
> cpu_intc_offset.
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

Looks good to me

Reviewed-by: Yu Chien Peter Lin <peterlin@andestech.com>

