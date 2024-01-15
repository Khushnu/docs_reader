class GridViewModel{
  final String name; 
  final String image;

  GridViewModel({required this.image, required this.name}); 
}

List<GridViewModel> gridViewList = [
  GridViewModel(image: 'Assests/pdf.png', name: 'Pdf files'),
  GridViewModel(image: 'Assests/doc.png', name: 'Doc files'),
  GridViewModel(image: 'Assests/xls.png', name: 'Excel files'),
  GridViewModel(image: 'Assests/ppt.png', name: 'PPT files'),
];