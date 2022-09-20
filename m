From: Leo Liang <ycliang@andestech.com>
Date: Tue, 20 Sep 2022 06:56:40 +0000
Subject: [PATCH 02/12] platform: ae350: Use kconfig to set platform
 version and default name
In-Reply-To: <20220915015121.27596-3-peterlin@andestech.com>
References: <20220915015121.27596-1-peterlin@andestech.com>
 <20220915015121.27596-3-peterlin@andestech.com>
Message-ID: <YylkHLWRbqKj1Qt1@ubuntu01>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 15, 2022 at 09:51:11AM +0800, Yu Chien Peter Lin wrote:
> This patch makes andes platform name and version can be set in
> menuconfig interface.
> 
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
>  platform/andes/ae350/Kconfig    | 18 ++++++++++++++++++
>  platform/andes/ae350/platform.c |  6 ++++--
>  2 files changed, 22 insertions(+), 2 deletions(-)

Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>

