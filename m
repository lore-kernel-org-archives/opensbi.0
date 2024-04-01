From: Ivan Orlov <ivan.orlov0322@gmail.com>
Date: Mon,  1 Apr 2024 22:34:37 +0100
Subject: [PATCH 2/3] scripts/carray.sh: Add comment to generated files
In-Reply-To: <20240401213438.590209-1-ivan.orlov0322@gmail.com>
References: <20240401213438.590209-1-ivan.orlov0322@gmail.com>
Message-ID: <20240401213438.590209-3-ivan.orlov0322@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a comment about where auto-generated file came from to the carray.sh
output. This should help avoiding confusion for the developers looking
at the build artifacts and finding .c files there.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
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
2.34.1


