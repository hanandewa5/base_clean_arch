
extension ListExtension<T> on List<T> {
  List<T> getPaged(int page, int pageSize) {
    final List<T> pagedResult = [];
    int dataLength = length;
    int pageCount = (dataLength / pageSize).ceil();
    int offset = (page - 1) * pageSize;
    if (offset > dataLength) {
    } else {
      if (isNotEmpty) {
        if (page == pageCount) {
          pagedResult.addAll(getRange(offset, dataLength));
        } else {
          pagedResult.addAll(getRange(offset, offset + pageSize));
        }
      }
    }
    return pagedResult;
  }

  int getTotalPage(int pageSize) {
    int dataLength = length;
    int pageCount = (dataLength / pageSize).ceil();
    return pageCount;
  }
}
