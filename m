From: Dongdong Zhang <zhangdongdong@eswincomputing.com>
Date: Tue, 29 Nov 2022 11:54:06 +0800
Subject: [PATCH 0/1] firmware: Minor optimization for relocate
Message-ID: <20221129035407.28946-1-zhangdongdong@eswincomputing.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The t3 register stores the address of _load_end. If relocation is not required, it is unnecessary to calculate the address of _load_end.

This can reduce the operation time of two instructions.

Dongdong Zhang (1):
  firmware: Minor optimization for relocate

 firmware/fw_base.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.17.1


