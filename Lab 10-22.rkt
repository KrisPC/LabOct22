;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Lab 10-22|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;towersOfHanoi
(define newTower
  (lambda (d1 d2 d3)
    (list 'tower d1 d2 d3)))

(define displayTower
  (lambda (tower)
    tower))

(define emptyTower
  (lambda ()
    (list 'tower '())))

(define initGame
  (lambda (tower1 tower2 tower3)
    (list tower1 tower2 tower3)))

(define isLegal?
  (lambda (source destination)
    (cond
      ((null? (displayTower source)) #f)
      ((null? (displayTower destination)) #t)
      ((> (cadr destination) (cadr source)) #f)
       (else #t))))

(define getTower1
  (lambda (gameBoard)
    (car gameBoard)))

(define getTower2
  (lambda (gameBoard)
    (cadr gameBoard)))

(define getTower3
  (lambda (gameBoard)
    (caddr gameBoard)))

(define numToTower
  (lambda (gameBoard num)
    (cond
      ((= num 1) (getTower1 gameBoard))
      ((= num 2) (getTower2 gameBoard))
      ((= num 3) (getTower3 gameBoard)))))

(define makeMove
  (lambda (gameBoard sourceTower destinationTower)
    (if(isLegal? sourceTower destinationTower)
       (cond
         ((and(= sourceTower 1) (= destinationTower 2)) (list(list 'tower (cddr (car gameBoard))) (cons (cadr (car gameBoard)) (cadr gameBoard)) (caddr gameBoard)))
         ((and(= sourceTower 1) (= destinationTower 3)) (list(list 'tower (cddr (car gameBoard))) (cadr gameBoard) (cons (cadr (car gameBoard)) (caddr gameBoard))))
         ((and(= sourceTower 2) (= destinationTower 1)) (list(cons (cadr (cadr gameBoard)) (car gameBoard)) (list 'tower (cddr (cadr gameBoard))) (caddr gameBoard)))
         ((and(= sourceTower 2) (= destinationTower 3)) (list(car gameBoard) (list 'tower (cddr (cadr gameBoard))) (cons (cadr (cadr gameBoard)) (caddr gameBoard))))
         ((and(= sourceTower 3) (= destinationTower 1)) (list(cons (cadr (caddr gameBoard)) (car gameBoard)) (cadr gameBoard) (list 'tower (cddr (caddr gameBoard)))))
         ((and(= sourceTower 3) (= destinationTower 2)) (list(car gameBoard) (cons (cadr (caddr gameBoard)) (cadr gameBoard)) (list 'tower (cddr (caddr gameBoard))))))
       (display '(This aint it chief)))))

(define isWinner
  (lambda (gameBoard)
    (if(and(null? (cdr gameBoard)) (null? (cdr gameBoard)))
       #t
       #f)))

(define tower1 (newTower 1 2 3))
(define tower2 (emptyTower))
(define tower3 (emptyTower))
(define gameBoard (initGame tower1 tower2 tower3))

(makeMove gameBoard 1 2)


