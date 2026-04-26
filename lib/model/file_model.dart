class FileModel {
  late String fileName;
  late String desc;
  FileModel({
    required this.fileName,
    required this.desc    
  });
  factory FileModel.fromJson(Map<String, dynamic> data){
    return FileModel(
      fileName: data['fileName'] ?? "", 
      desc: data['fileDesc'] ?? ""
    );
  }
  Map<String, dynamic> toJson() => {
    'fileName': fileName,
    'fileDesc': desc
  };
}