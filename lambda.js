exports.test = async (event, context) => {
  console.log("Event: ", JSON.stringify(event, null, 2));
  return {
    statusCode: 200,
    body: JSON.stringify('Hello, World!'),
  };
};

