;; *Exercise 1.14:* Draw the tree illustrating the process generated
;; by the `count-change' procedure of section *Note 1-2-2:: in making
;; change for 11 cents.  What are the orders of growth of the space
;; and number of steps used by this process as the amount to be
;; changed increases?
(load "count-change.scm")
(cc-graph 11 5)

O(n) for space, O(n^5) for number of steps
