class GetPhraseResponse<T> {
  final bool success;
  final T? data;
  final String? error;

  GetPhraseResponse.success(this.data) : success = true, error = null;

  GetPhraseResponse.error(this.error) : success = false, data = null;
}
