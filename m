From: Qingfang Deng <dqfext@gmail.com>
Date: Wed, 27 Mar 2024 21:16:37 +0800
Subject: [PATCH 0/9] T-Head: Allow read access to th.mxstatus CSR
In-Reply-To: <20240327101137.3644359-1-christoph.muellner@vrull.eu>
References: <20240327101137.3644359-1-christoph.muellner@vrull.eu>
Message-ID: <20240327131637.1934-1-dqfext@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Christoph,

You don't need the access to MXSTATUS. There is SXSTATUS which is a
read-only mirror of MXSTATUS in S-mode.

