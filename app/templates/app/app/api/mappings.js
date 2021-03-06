export default (localPath) => {

  const mappings = [
    {
      req    : '/',
      apiPath: '/component'
    }
  ];

  for (let mapping of mappings) {
    if (mapping.req === localPath) {
      return mapping.apiPath;
    }
  }

  return localPath;

}
