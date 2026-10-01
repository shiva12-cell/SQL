/*
Question: Tree Node
URL: https://leetcode.com/problems/tree-node/

Description:
Each node in the tree can be one of three types:
- 'Root': if the node is root node (p_id IS NULL).
- 'Leaf': if the node is a leaf node (it has a parent and is not the parent of any node).
- 'Inner': if the node is neither a leaf node nor a root node.

Table: Tree (id INT, p_id INT)
*/

SELECT 
    id,
    CASE WHEN child_ct = 0 AND type = "Not Root" THEN "Leaf"
         WHEN child_ct > 0 AND type = "Not Root" THEN 'Inner'
         ELSE type
    END AS type
FROM (
SELECT 
    L.id,  
    CASE WHEN L.p_id IS NULL THEN 'Root' ELSE 'Not Root' END AS type,
    SUM(CASE WHEN R.id IS NULL THEN 0 ELSE 1 END) AS child_ct
From
    Tree AS L
LEFT JOIN
    Tree AS R
ON 
    L.id = R.p_id
GROUP BY 1,2
) Base
;

/*
Explanation:
1. Uses a CASE statement:
   - WHEN p_id IS NULL THEN 'Root'`n   - WHEN id IN (SELECT p_id FROM Tree WHERE p_id IS NOT NULL) THEN 'Inner'`n   - ELSE 'Leaf'`n2. Note: WHERE p_id IS NOT NULL in the subquery is critical because IN (NULL, ...) produces UNKNOWN logic in SQL.
*/