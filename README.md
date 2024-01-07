## 테이블뷰컨트롤러 구현하기

![asign](https://github.com/Jin0331/TableVCPractice/assets/42958809/2b116a02-8cec-47ee-a306-ea9931524000)



(1) Table View의 Contents 
  1) Case1은 Static Cell, Case2/3은 Dynamic Prototypes

(2) Table View Cell Style Custom으로 해보기
  1) Case2는 Custom 모드에서 Attributes Inspector를 활용
  2) Case3는 ImageView, Label, Button을 추가하고 IBOutlet으로 연결하여 Custom 적용
     - 이 방법에서는 cell의 identifier를 설정할 때 as!을 이용한 형 변환이 필요함
