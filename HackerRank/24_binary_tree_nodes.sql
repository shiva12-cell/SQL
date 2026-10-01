/*
Question: Binary Tree Nodes
URL: https://www.hackerrank.com/challenges/binary-search-tree-1/problem

Description:
Write a query to find the node type of Binary Tree ordered by the value of the node (N).
- Root: If node is root (P IS NULL).
- Leaf: If node is leaf (N is not present in column P).
- Inner: If node is neither root nor leaf.

Table: BST
Columns: N (INTEGER), P (INTEGER)
*/

SELECT BT.N,
CASE
    WHEN BT.P IS NULL THEN 'Root'
    WHEN EXISTS (SELECT B.P FROM BST B WHERE B.P = BT.N) THEN 'Inner'        
    ELSE 'Leaf'
END
FROM BST AS BT 
ORDER BY BT.N

/*
Explanation:
1. Evaluates node role with CASE: WHEN P IS NULL THEN 'Root'.
2. Checks if N acts as a parent to any other node: WHEN N IN (SELECT DISTINCT P FROM BST WHERE P IS NOT NULL) THEN 'Inner'.
3. Otherwise, the node has a parent but no children: ELSE 'Leaf'.
4. Orders results by node value ORDER BY N ASC.
*/