/* tree predicates */
istree(nil).
istree(tree(_,Left,Right)) :- istree(Left), istree(Right).

emptyBT = nil.
bTree(tree(_,nil,nil)).
bTree(tree(N,Left,nil)) :- Left =< N.
bTree(tree(N,nil,Right)) :- N < Right.
bTree(tree(_,Left,Right)) :- bTree(Left), bTree(Right).
bTree(tree(N,Left,Right)) :- Left =< N, N < Right.
