 
 
export const fetchAllTodos = () => {
 return $.ajax({
    method: 'GET',
    url: '/api/todos'
  }).then(
    todos => console.log(todos),
    error => console.log(error)
  );
}