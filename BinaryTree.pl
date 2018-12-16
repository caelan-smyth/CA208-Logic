/* tree predicates */
istree(nil).
istree(tree(_,Left,Right)) :- istree(Left), istree(Right).

emptyBT = nil.
bTree(tree(_,nil,nil)).
bTree(tree(N,Left,nil)) :- Left =< N.
bTree(tree(N,nil,Right)) :- N < Right.
bTree(tree(_,Left,Right)) :- bTree(Left), bTree(Right).
bTree(tree(N,Left,Right)) :- Left =< N, N < Right.

/* preorder traversal */
preorder(T,L) :- bTree(T), bTree(T(N,Left,Right)), append(N,[Left|Right],L).
preorder(T,L) :- bTree(T(_,Left,_)), preorder(Left,L).
preorder(T,L) :- bTree(T(_,_,Right)), preorder(Right,L).

/* inorder traversal */
inorder(T,L) :- bTree(T), bTree(T(N,Left,Right)), append(Left,[N|Right],L).
inorder(T,L) :- bTree(T(N,_,_)), inorder(N,L).
inorder(T,L) :- bTree(T(_,_,Right)), inorder(Right,L).

/* postorder traversal */
postorder(T,L) :- bTree(T), bTree(T(N,Left,Right)), append(Left,[Right|N],L).
postorder(T,L) :- bTree(T(_,_,Right)), inorder(Right,L).
postorder(T,L) :- bTree(T(N,_,_)), append(_,[_|N],L).

/* search */
search(T,I) :- bTree(T(I,_,_)).
search(T,I) :- bTree(T(_,I,_)).
search(T,I) :- bTree(T(_,_,I)).
search(T,I) :- bTree(T(_,N,_)), search(N,I).
search(T,I) :- bTree(T(_,_,N)), search(N,I).

/* height */
height(T,H) :- bTree(T(nil,nil,nil)), H is 0.
height(T,H) :- bTree(T(_,nil,nil)), H is 1.
height(T,H) :- bTree(T(_,Left,Right)), height(Left,H1), height(Right,H2), H is max(H1,H2) + 1.
