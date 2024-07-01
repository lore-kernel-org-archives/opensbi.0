From: Ben Dooks <ben.dooks@codethink.co.uk>
Date: Mon,  1 Jul 2024 15:10:58 +0100
Subject: [PATCH 1/4] scripts/carray.sh: Add comment to generated files
In-Reply-To: <20240701141101.20227-1-ben.dooks@codethink.co.uk>
References: <20240701141101.20227-1-ben.dooks@codethink.co.uk>
Message-ID: <20240701141101.20227-2-ben.dooks@codethink.co.uk>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Ivan Orlov <ivan.orlov0322@gmail.com>

Add a comment about where auto-generated file came from to the carray.sh
output. This should help avoiding confusion for the developers looking
at the build artifacts and finding .c files there.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 scripts/carray.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/carray.sh b/scripts/carray.sh
index 13f9d36..1fa2366 100755
--- a/scripts/carray.sh
+++ b/scripts/carray.sh
@@ -61,6 +61,7 @@ if [ -z "${ARRAY_NAME}" ]; then
 	usage
 fi
 
+printf "// Generated with $(basename $0) from $(basename ${CONFIG_FILE})\n"
 printf "#include <%s>\n\n" "${TYPE_HEADER}"
 
 for VAR in ${VAR_LIST}; do
-- 
2.37.2.352.g3c44437643


