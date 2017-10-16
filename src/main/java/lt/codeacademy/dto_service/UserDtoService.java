package lt.codeacademy.dto_service;

import lt.codeacademy.dto.UserDto;
import lt.codeacademy.model.Role;
import lt.codeacademy.model.User;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserDtoService {

    public UserDto convertToUserDto(User user) {
        UserDto userDto = new UserDto();
        userDto.setEmail(user.getEmail());
        userDto.setName(user.getName());

        List<String> roleNames = new ArrayList<>();
        for (Role role : user.getRoles()) {
            roleNames.add(role.getName());
        }
        userDto.setRoleNames(roleNames);
        userDto.setId(user.getId());
        return userDto;
    }
}
