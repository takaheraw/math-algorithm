(defstruct node
  state
  parent
  cost
  estimated-cost)

(defun beam-search (start goal beam-width)
  (let ((beam (list (make-node :state start :parent nil :cost 0 :estimated-cost (heuristic start goal)))))
    (loop until (null beam) do
      (let ((new-beam '()))
        (dolist (node beam)
          (if (equal (node-state node) goal)
              (return-from beam-search (construct-path node))
              (setf new-beam (append new-beam (expand node goal)))))
        (setf beam (subseq (sort new-beam #'< :key #'node-estimated-cost) 0 (min beam-width (length new-beam))))))
    nil))

(defun expand (node goal)
  (let ((children '()))
    (dolist (transition '((1 2) (2 3) (3 4)))
      (let* ((new-state (first transition))
             (cost (second transition))
             (new-cost (+ (node-cost node) cost))
             (estimated-cost (+ new-cost (heuristic new-state goal))))
        (push (make-node :state new-state
                         :parent node
                         :cost new-cost
                         :estimated-cost estimated-cost)
              children)))
    children))

(defun heuristic (state goal)
  (abs (- goal state)))

(defun construct-path (node)
  (loop for n = node then (node-parent n)
        while n
        collect (node-state n) into path
        finally (return (reverse path))))

;; 使用例
(defun main ()
  (let ((start 0)
        (goal 10)
        (beam-width 2))
    (format t "Path found: ~A" (beam-search start goal beam-width))))

(main)
